//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AssignmentS2P2
{
    using System;
    using System.Collections.Generic;
    
    public partial class HotelBooking
    {
        public int BookingID { get; set; }
        public string Booking_User { get; set; }
        public int RoomID { get; set; }
        public System.DateTime CheckInDate { get; set; }
        public System.DateTime CheckOutDate { get; set; }
        public int ServiceID { get; set; }
        public decimal Price { get; set; }
        public int TransactionID { get; set; }
    
        public virtual User User { get; set; }
        public virtual HotelRoom HotelRoom { get; set; }
        public virtual HotelRoomService HotelRoomService { get; set; }
        public virtual Transaction Transaction { get; set; }
    }
}
