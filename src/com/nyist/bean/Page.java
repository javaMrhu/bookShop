package com.nyist.bean;

import java.util.List;

public class Page {
    private int totalPage;//总页数
    private int totalCount;//书的总数
    private int pageNum;//当前页
    private List<Book> list;
    private int pageSize=3;//页面大小
    private int startPage;//开始页
    private int endPage;//结束页

    private int startIndex;
    public Page(int currentPage,int totalCount){
        this.pageNum = currentPage;
        this.totalCount = totalCount;
        this.startIndex = (this.pageNum-1)*this.pageSize;
        this.totalPage = (this.totalCount+this.pageSize-1)/this.pageSize;

        if(this.totalPage<=3){
            startPage = 1;
            endPage = 3;
        }else{
            this.startPage = pageNum-1;
            this.endPage = pageNum+1;

            if(this.endPage>this.totalPage){
                this.startPage = this.totalPage-2;
                this.endPage=this.totalPage;
            }

            if(this.startPage<1){
                this.startPage = 1;
                this.endPage = 3;
            }
        }
    }


    @Override
    public String toString() {
        return "Page{" +
                "totalPage=" + totalPage +
                ", totalCount=" + totalCount +
                ", pageNum=" + pageNum +
                ", list=" + list +
                ", pageSize=" + pageSize +
                ", startPage=" + startPage +
                ", endPage=" + endPage +
                ", startIndex=" + startIndex +
                '}';

    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public List<Book> getList() {
        return list;
    }

    public void setList(List<Book> list) {
        this.list = list;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getStartPage() {
        return startPage;
    }

    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public int getStartIndex() {
        return startIndex;
    }

    public void setStartIndex(int startIndex) {
        this.startIndex = startIndex;
    }
}
