package com.jarorwar.service;

import com.jarorwar.model.Channel;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: mimiloveququ
 * Date: 12-12-2
 * Time: 上午1:52
 * To change this template use File | Settings | File Templates.
 */
public interface IChannelService {
    public int addChannel(Channel channel)throws Exception;

    public int updateChannel(Channel channel)throws Exception;

    public List<Channel> getChannelByStatu(String statu) throws Exception;

    public int delteChannel(String id) throws Exception;

}
