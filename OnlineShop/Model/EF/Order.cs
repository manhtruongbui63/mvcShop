namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Order")]
    public partial class Order
    {
        public long ID { get; set; }

        public long? CustomerID { get; set; }

        [Column(TypeName = "date")]
        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        [Required(ErrorMessage = "ShipName is required")]
        public string ShipName { get; set; }

        [StringLength(50)]
        [Required(ErrorMessage = "ShipMobile is required")]
        public string ShipMobile { get; set; }

        [StringLength(50)]
        [Required(ErrorMessage = "ShipAddress is required")]
        public string ShipAddress { get; set; }

        [StringLength(50)]
        [Required(ErrorMessage = "ShipEmail is required")]
        public string ShipEmail { get; set; }

        public int? Status { get; set; }
    }
}
