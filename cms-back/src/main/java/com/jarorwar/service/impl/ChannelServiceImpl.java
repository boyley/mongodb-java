package com.jarorwar.service.impl;

import com.jarorwar.mapper.ChannelMapper;
import com.jarorwar.model.Channel;
import com.jarorwar.service.IChannelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: mimiloveququ
 * Date: 12-12-2
 * Time: 上午1:54
 * To change this template use File | Settings | File Templates.
 */
@Service
@Transactional
public class ChannelServiceImpl implements IChannelService {
    @Autowired
    private ChannelMapper channelMapper;
    
    @Override
    public int addChannel(Channel channel) throws Exception {
        Assert.notNull(channel,"要保存的频道不能为空");

        int rs = channelMapper.addChannel(channel);
        return 0;
    }

    @Override
    public int updateChannel(Channel channel) throws Exception {
        return 0;  
    }

    @Override
    public List<Channel> getChannelByStatu(String statu) throws Exception {
        return null;  
    }

    @Override
    public int delteChannel(String id) throws Exception {
        return 0;  
    }
}
