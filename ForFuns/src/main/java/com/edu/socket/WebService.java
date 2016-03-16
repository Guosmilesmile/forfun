package com.edu.socket;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;
 











import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.server.standard.SpringConfigurator;

import com.edu.model.Customer;
import com.edu.model.Message;
import com.edu.service.ICustomerService;
import com.edu.service.IMessageService;
import com.edu.util.FastJsonTool;
 
//该注解用来指定一个URI，客户端可以通过这个URI来连接到WebSocket。类似Servlet的注解mapping。无需在web.xml中配置。
@ServerEndpoint(value= "/websocket",configurator=SpringConfigurator.class)
public class WebService {
	
	@Autowired
	private IMessageService messageService;
	@Autowired
	private ICustomerService customerService;
	
    //静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。
    private static int onlineCount = 0;
    //concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。若要实现服务端与单一客户端通信的话，可以使用Map来存放，其中Key可以为用户标识
    //private static CopyOnWriteArraySet<MyWebSocket> webSocketSet = new CopyOnWriteArraySet<MyWebSocket>();
    private static ConcurrentHashMap<String, WebService> webSocketSet = new ConcurrentHashMap<String, WebService>();
    //与某个客户端的连接会话，需要通过它来给客户端发送数据
    private Session session;
     
    /**
     * 连接建立成功调用的方法
     * @param session  可选的参数。session为与某个客户端的连接会话，需要通过它来给客户端发送数据
     */
    @OnOpen
    public void onOpen(Session session){
        this.session = session;
        //webSocketSet.add(this);     //加入set中
        addOnlineCount();           //在线数加1
        System.out.println("有新连接加入！当前在线人数为" + getOnlineCount());
    }
     
    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose(){
        subOnlineCount();           //在线数减1    
        System.out.println("有一连接关闭！当前在线人数为" + getOnlineCount());
    }
     
    /**
     * 收到客户端消息后调用的方法
     * @param message 客户端发送过来的消息
     * @param session 可选的参数
     */
    @OnMessage
    public void onMessage(String message, Session session) {
        System.out.println("来自客户端的消息:" + message);
        MyMessage myMessage = FastJsonTool.getObject(message, MyMessage.class);
        
        if("0".equals(myMessage.getFlag())){//开启连接
        	webSocketSet.put(myMessage.getSendid(), this);
        	System.out.println("hashmap.size:" + webSocketSet.size());
        	//返回未读信息
        	List<Message> unReadMessage = messageService.getUnReadMessage(Integer.parseInt(myMessage.getReceiverid()),Integer.parseInt(myMessage.getSendid()));
        	List<MessageVO> returnMessage = MessageVO.ChangeToListMessageVO(unReadMessage);
        	if(null == unReadMessage){
        		
        	}else{
				try {
					WebService item = webSocketSet.get(myMessage.getSendid());
					item.sendMessage(FastJsonTool.createJsonString(returnMessage));
				} catch (IOException e) {
					e.printStackTrace();
				}
        	}
        }else if("1".equals(myMessage.getFlag())){//关闭连接
        	webSocketSet.remove(myMessage.getSendid());
        	System.out.println("hashmap.size:" + webSocketSet.size());
        }else if("2".equals(myMessage.getFlag())){//发送消息
        	try {
        		Message messageBean = new Message();
                Integer fromid = Integer.parseInt(myMessage.getSendid());
                Integer toid = Integer.parseInt(myMessage.getReceiverid());
                Customer fromBean = customerService.GetEntityById(Customer.class, fromid);
                Customer toBean = customerService.GetEntityById(Customer.class, toid);
                messageBean.setFromCustomerBean(fromBean);
                messageBean.setToCustomerBean(toBean);
                messageBean.setMessage(myMessage.getContent());
                messageBean.setCurrent(new Date());
                messageBean.setIsread(0);
                messageService.AddBean(messageBean);
                
                boolean containsKey = webSocketSet.containsKey(toid+"");
                if(containsKey){
                	WebService item = webSocketSet.get(myMessage.getReceiverid());
    				//item.sendMessage(myMessage.getContent());
                	List<MyMessage> list = new ArrayList<MyMessage>();
                	list.add(myMessage);
                	item.sendMessage(FastJsonTool.createJsonString(list));
    				messageBean.setIsread(1);
    				messageService.UpdataBean(messageBean);
                }
			} catch (Exception e) {
				e.printStackTrace();
			}
        }else if("3".equals(myMessage.getFlag())){//表示已经读取消息
        	
        }
    }
     
    /**
     * 发生错误时调用
     * @param session
     * @param error
     */
    @OnError
    public void onError(Session session, Throwable error){
        System.out.println("发生错误");
        error.printStackTrace();
    }
     
    /**
     * 这个方法与上面几个方法不一样。没有用注解，是根据自己需要添加的方法。
     * @param message
     * @throws IOException
     */
    public void sendMessage(String message) throws IOException{
        this.session.getBasicRemote().sendText(message);
    }
 
    public static synchronized int getOnlineCount() {
        return onlineCount;
    }
 
    public static synchronized void addOnlineCount() {
        WebService.onlineCount++;
    }
     
    public static synchronized void subOnlineCount() {
        WebService.onlineCount--;
    }
}