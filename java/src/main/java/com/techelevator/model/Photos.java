package com.techelevator.model;

public class Photos {
    private Long user_id = null;
    private String path = "";
    private boolean isFeatured = false;

    public Photos(Long user_id, String path, boolean isFeatured) {
        this.user_id = user_id;
        this.path = path;
        this.isFeatured = isFeatured;
    }

    public Long getUser_id() {
        return user_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public boolean isFeatured() {
        return isFeatured;
    }

    public void setFeatured(boolean featured) {
        isFeatured = featured;
    }
}
