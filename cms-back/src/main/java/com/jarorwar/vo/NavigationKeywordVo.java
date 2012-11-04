package com.jarorwar.vo;

import com.jarorwar.model.NavigationKeyword;


public class NavigationKeywordVo extends NavigationKeyword {
    //Vo...
    private String _parentId;

    public String get_parentId() {
        return _parentId;
    }

    public void set_parentId(String _parentId) {
        this._parentId = _parentId;
    }

}
