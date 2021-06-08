namespace ModelValidationEg.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialCreate : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Employees",
                c => new
                    {
                        Eid = c.Int(nullable: false, identity: true),
                        Ename = c.String(nullable: false),
                        Email = c.String(nullable: false),
                        PhoneNumber = c.String(nullable: false, maxLength: 10),
                        doj = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.Eid);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.Employees");
        }
    }
}
