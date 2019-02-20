package com.sexteam.vo;

import java.util.List;

public class PageBean<T> {
    //已知的数据
    private int pageNumber;//当前的页数
    private int pageSize;//每页显示的数量
    private int totalCount;//总的数量，数据库里面总的数量
    //需要根据已知数量计算的得来
    private int totalPage ;//总的页数
    //开始的索引，从哪条开始
    private int startIndex;
    //要显示的条目
    private List<T>list;
    //分页显示的页数  star 为开始，end为结束
    private int start;
    private int end;

    public PageBean() {
    }

    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getStartIndex() {
        return startIndex;
    }

    public void setStartIndex(int startIndex) {
        this.startIndex = startIndex;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getEnd() {
        return end;
    }

    public void setEnd(int end) {
        this.end = end;
    }

    //创建一个构造方法
    public PageBean(int pageNumber, int pageSize, int totalCount) {
        this.pageNumber = pageNumber;
        this.pageSize = pageSize;
        this.totalCount = totalCount;
        if(totalCount%pageSize==0){
            this.totalPage=totalCount/pageSize;
        }else {
            this.totalPage=totalCount/pageSize+1;
        }
        this.startIndex=(pageNumber-1)*pageSize;
        this.start=1;
        this.end=5;
        if(totalPage<=5){
            this.end=totalPage;
        }else{
            this.start=pageNumber-2;
            this.end=pageNumber+2;
            if(start<=0){
                this.start=1;
                this.end=5;
            }
            if(end>this.totalPage){
                this.end=totalPage;
                this.start=this.end-4;
            }
        }

    }
}
