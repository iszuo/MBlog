//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace MBlog.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Msg
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Msg()
        {
            this.Make = new HashSet<Make>();
        }
    
        public int Id { get; set; }
        public int Userid { get; set; }
        public string Text { get; set; }
        public Nullable<System.DateTime> sendtime { get; set; }
        public Nullable<int> Click_num { get; set; }
        public string Address { get; set; }
        public string Topic { get; set; }
        public string Pic { get; set; }
        public string Video { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Make> Make { get; set; }
        public virtual User User { get; set; }
    }
}