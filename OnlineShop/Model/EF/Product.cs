namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Product")]
    public partial class Product
    {
        public long ID { get; set; }

        [StringLength(250)]
        [Required(ErrorMessage = "The Name field is required")]
        public string Name { get; set; }

        public bool? Status { get; set; }

        [StringLength(250)]
        public string MetaTitle { get; set; }

        [StringLength(250)]
        [Required(ErrorMessage = "The Description field is required")]
        public string Description { get; set; }

        [StringLength(250)]
        public string Image { get; set; }

        public decimal? Price { get; set; }

        [Required(ErrorMessage = "The Quantity field is required")]
        public int? Quantity { get; set; }

        public long? CategoryID { get; set; }

        [Column(TypeName = "ntext")]
        [Required(ErrorMessage = "The Detail field is required")]
        public string Detail { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(50)]
        public string ModifiedBy { get; set; }

        public DateTime? TopHot { get; set; }
    }
}
