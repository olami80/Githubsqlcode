--cursor--

  begin
	declare @empid int;
	declare @name varchar(20);
	declare @sal  numeric(20);
	declare empcur cursor for 
	Select employee_id,first_name,salary from dbo.employees where office_id = 4;
	open empcur;
	fetch next from empcur into @empid,@name,@sal;
	while @@FETCH_STATUS = 0
	begin 
		print @name;
		print @sal;
		fetch next from empcur into @empid,@name,@sal;
	end
	close empcur;
	deallocate empcur;
end
------------------------------------

  begin
	declare @empid int;
	declare @name varchar(20);
	declare @sal  numeric(20);
	declare empcur cursor for 
	Select employee_id,first_name,salary from dbo.employees where office_id = 4;
	open empcur;
	fetch next from empcur into @empid,@name,@sal;
	while @@FETCH_STATUS = 0
	begin 
		if @sal <= 50000
		begin
			set @sal = @sal + 100000
		end
		else
		begin
			set @sal=@sal +50000
		end
		update dbo.employees set salary = @sal where employee_id = @empid
		print @name  +  ' now earns  '   + cast(@sal as varchar);
		fetch next from empcur into @empid,@name,@sal;
	end 
	close empcur;
	deallocate empcur;
end
