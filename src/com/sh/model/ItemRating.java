package com.sh.model;

import java.io.Serializable;
/**
 * Describes the Rating info for the CF Engine - userID, itemID, and rating.
 *
 * @author  
 * 
 */
public class ItemRating implements Serializable {

    // data members
    private int userID;
    private int itemID;
    private float rating;

    
    /**
     * Constructor.
     * @param userID
     * @param itemID
     * @param rating
     */
        
    public ItemRating(int userID, int itemID, float rating) {
        this.userID = userID;
        this.itemID = itemID;
        this.rating = rating;
    }    

    /**
     * Accessor, return userID.
     * @return userID
     */
    public int getUserID() {
        return userID;
    }

    /**
     * Accessor, return itemID.
     * @return itemID
     */
    public int getItemID() {
        return itemID;
    }
    
    /**
     * Accessor, return rating.
     * @return rating
     */
    public float getRating() {
        return rating;
    }
}
