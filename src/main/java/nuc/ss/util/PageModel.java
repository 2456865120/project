package nuc.ss.util;

import java.io.Serializable;

public class PageModel implements Serializable {
    private Integer pageIndex=1;
    private Integer pageSize=6;
    private Integer recordCount;
    public Integer getPageIndex() {
        return pageIndex;
    }
    public void setPageIndex(Integer pageIndex) {
        this.pageIndex = pageIndex;
    }
    public Integer getPageSize() {
        return pageSize;
    }
    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }
    public Integer getRecordCount() {
        return recordCount;
    }
    public void setRecordCount(Integer recordCount) {
        this.recordCount = recordCount;
    }

    public PageModel() {
        super();
    }
    public PageModel(Integer pageIndex, Integer pageSize, Integer recordCount) {
        super();
        this.pageIndex = pageIndex;
        this.pageSize = pageSize;
        this.recordCount = recordCount;
    }

}

