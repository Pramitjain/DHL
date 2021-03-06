USE [master]
GO
/****** Object:  Database [IB_DOC_Review]    Script Date: 2/4/2021 10:59:15 AM ******/
CREATE DATABASE [IB_DOC_Review]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IB_DOC_Review', FILENAME = N'F:\GPI_SQLData\IB_DOC_Review.mdf' , SIZE = 23552KB , MAXSIZE = 204800KB , FILEGROWTH = 20480KB )
 LOG ON 
( NAME = N'IB_DOC_Review_log', FILENAME = N'F:\GPI_SQLLog\IB_DOC_Review_log.ldf' , SIZE = 129024KB , MAXSIZE = 307200KB , FILEGROWTH = 30720KB )
GO
ALTER DATABASE [IB_DOC_Review] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IB_DOC_Review].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IB_DOC_Review] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IB_DOC_Review] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IB_DOC_Review] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IB_DOC_Review] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IB_DOC_Review] SET ARITHABORT OFF 
GO
ALTER DATABASE [IB_DOC_Review] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IB_DOC_Review] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [IB_DOC_Review] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IB_DOC_Review] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IB_DOC_Review] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IB_DOC_Review] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IB_DOC_Review] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IB_DOC_Review] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IB_DOC_Review] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IB_DOC_Review] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IB_DOC_Review] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IB_DOC_Review] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IB_DOC_Review] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IB_DOC_Review] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IB_DOC_Review] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IB_DOC_Review] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IB_DOC_Review] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IB_DOC_Review] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IB_DOC_Review] SET RECOVERY FULL 
GO
ALTER DATABASE [IB_DOC_Review] SET  MULTI_USER 
GO
ALTER DATABASE [IB_DOC_Review] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IB_DOC_Review] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IB_DOC_Review] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IB_DOC_Review] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'IB_DOC_Review', N'ON'
GO
USE [IB_DOC_Review]
GO
/****** Object:  User [PRG-DC\UDLDHL-SQLmigdist]    Script Date: 2/4/2021 10:59:19 AM ******/
CREATE USER [PRG-DC\UDLDHL-SQLmigdist] FOR LOGIN [PRG-DC\UDLDHL-SQLmigdist]
GO
/****** Object:  User [KUL-DC\svaidya]    Script Date: 2/4/2021 10:59:20 AM ******/
CREATE USER [KUL-DC\svaidya] FOR LOGIN [KUL-DC\svaidya] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [KUL-DC\srv_mykul-Cmd1198]    Script Date: 2/4/2021 10:59:21 AM ******/
CREATE USER [KUL-DC\srv_mykul-Cmd1198] FOR LOGIN [KUL-DC\srv_mykul-Cmd1198] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [KUL-DC\pasharma]    Script Date: 2/4/2021 10:59:22 AM ******/
CREATE USER [KUL-DC\pasharma] FOR LOGIN [KUL-DC\pasharma] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [KUL-DC\operator_svaidya]    Script Date: 2/4/2021 10:59:24 AM ******/
CREATE USER [KUL-DC\operator_svaidya] FOR LOGIN [KUL-DC\operator_svaidya] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [KUL-DC\operator_racvicha]    Script Date: 2/4/2021 10:59:25 AM ******/
CREATE USER [KUL-DC\operator_racvicha] FOR LOGIN [KUL-DC\operator_racvicha] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [KUL-DC\operator_narakhol]    Script Date: 2/4/2021 10:59:25 AM ******/
CREATE USER [KUL-DC\operator_narakhol] FOR LOGIN [KUL-DC\operator_narakhol] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [KUL-DC\operator_mpatil]    Script Date: 2/4/2021 10:59:25 AM ******/
CREATE USER [KUL-DC\operator_mpatil] FOR LOGIN [KUL-DC\operator_mpatil] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [KUL-DC\operator_mkjoshi]    Script Date: 2/4/2021 10:59:25 AM ******/
CREATE USER [KUL-DC\operator_mkjoshi] FOR LOGIN [KUL-DC\operator_mkjoshi] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [KUL-DC\operator_appsupp2]    Script Date: 2/4/2021 10:59:27 AM ******/
CREATE USER [KUL-DC\operator_appsupp2] FOR LOGIN [KUL-DC\operator_appsupp2] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [KUL-DC\Operator_appsupp1]    Script Date: 2/4/2021 10:59:28 AM ******/
CREATE USER [KUL-DC\Operator_appsupp1] FOR LOGIN [KUL-DC\Operator_appsupp1] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [KUL-DC\operator_adpandya]    Script Date: 2/4/2021 10:59:29 AM ******/
CREATE USER [KUL-DC\operator_adpandya] FOR LOGIN [KUL-DC\operator_adpandya] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [KUL-DC\mpatil]    Script Date: 2/4/2021 10:59:31 AM ******/
CREATE USER [KUL-DC\mpatil] FOR LOGIN [KUL-DC\mpatil] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [KUL-DC\mkjoshi]    Script Date: 2/4/2021 10:59:32 AM ******/
CREATE USER [KUL-DC\mkjoshi] FOR LOGIN [KUL-DC\mkjoshi] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [KUL-DC\Indiadsk]    Script Date: 2/4/2021 10:59:32 AM ******/
CREATE USER [KUL-DC\Indiadsk] FOR LOGIN [KUL-DC\indiadsk] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [KUL-DC\GDLKULDC-IN_WIN_APPSUPPORT]    Script Date: 2/4/2021 10:59:33 AM ******/
CREATE USER [KUL-DC\GDLKULDC-IN_WIN_APPSUPPORT] FOR LOGIN [KUL-DC\GDLKULDC-IN_WIN_APPSUPPORT]
GO
/****** Object:  User [KUL-DC\appsupp2]    Script Date: 2/4/2021 10:59:34 AM ******/
CREATE USER [KUL-DC\appsupp2] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [KUL-DC\appsupp1]    Script Date: 2/4/2021 10:59:34 AM ******/
CREATE USER [KUL-DC\appsupp1] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [KUL-DC\adpandya]    Script Date: 2/4/2021 10:59:34 AM ******/
CREATE USER [KUL-DC\adpandya] FOR LOGIN [KUL-DC\adpandya] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [KUL-DC\admin-pasharma]    Script Date: 2/4/2021 10:59:35 AM ******/
CREATE USER [KUL-DC\admin-pasharma] FOR LOGIN [KUL-DC\admin-pasharma] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [appslogin]    Script Date: 2/4/2021 10:59:35 AM ******/
CREATE USER [appslogin] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [applogin]    Script Date: 2/4/2021 10:59:36 AM ******/
CREATE USER [applogin] FOR LOGIN [applogin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [aaa]    Script Date: 2/4/2021 10:59:36 AM ******/
CREATE USER [aaa] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [PRG-DC\UDLDHL-SQLmigdist]
GO
ALTER ROLE [db_owner] ADD MEMBER [KUL-DC\svaidya]
GO
ALTER ROLE [db_owner] ADD MEMBER [KUL-DC\srv_mykul-Cmd1198]
GO
ALTER ROLE [db_owner] ADD MEMBER [KUL-DC\pasharma]
GO
ALTER ROLE [db_owner] ADD MEMBER [KUL-DC\operator_svaidya]
GO
ALTER ROLE [db_owner] ADD MEMBER [KUL-DC\operator_racvicha]
GO
ALTER ROLE [db_owner] ADD MEMBER [KUL-DC\operator_narakhol]
GO
ALTER ROLE [db_owner] ADD MEMBER [KUL-DC\operator_mpatil]
GO
ALTER ROLE [db_owner] ADD MEMBER [KUL-DC\operator_mkjoshi]
GO
ALTER ROLE [db_owner] ADD MEMBER [KUL-DC\operator_appsupp2]
GO
ALTER ROLE [db_owner] ADD MEMBER [KUL-DC\Operator_appsupp1]
GO
ALTER ROLE [db_owner] ADD MEMBER [KUL-DC\operator_adpandya]
GO
ALTER ROLE [db_owner] ADD MEMBER [KUL-DC\mpatil]
GO
ALTER ROLE [db_owner] ADD MEMBER [KUL-DC\mkjoshi]
GO
ALTER ROLE [db_owner] ADD MEMBER [KUL-DC\Indiadsk]
GO
ALTER ROLE [db_owner] ADD MEMBER [KUL-DC\GDLKULDC-IN_WIN_APPSUPPORT]
GO
ALTER ROLE [db_owner] ADD MEMBER [KUL-DC\appsupp2]
GO
ALTER ROLE [db_owner] ADD MEMBER [KUL-DC\appsupp1]
GO
ALTER ROLE [db_owner] ADD MEMBER [KUL-DC\adpandya]
GO
ALTER ROLE [db_owner] ADD MEMBER [KUL-DC\admin-pasharma]
GO
ALTER ROLE [db_owner] ADD MEMBER [appslogin]
GO
ALTER ROLE [db_owner] ADD MEMBER [applogin]
GO
ALTER ROLE [db_owner] ADD MEMBER [aaa]
GO
/****** Object:  StoredProcedure [dbo].[usp_DoxScreening_AddUpdateNegativeList]    Script Date: 2/4/2021 10:59:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_DoxScreening_AddUpdateNegativeList]



(@id int,



 @NegativeWord varchar(200),



 @Createdby varchar(100),



 @CreatedByUserid varchar(100),



 @CreatedIp varchar(40),



 @Message varchar(200) output,



 @type varchar(10)



)



as



begin







		if(@type='delete')



			begin



					if EXISTS( select  1 from t_DoxScreening_NegativeList with(NOLOCK) where LTRIM(RTRIM(LOWER(f_NegativeWord))) = LTRIM(RTRIM(LOWER(@NegativeWord))) and f_Active =1 )



				begin



					 update t_DoxScreening_NegativeList set f_Active= 0 , f_Updatedby = @Createdby,  f_UpdatedbyUserId = @CreatedByUserid , 



					f_UpdatedDate = GETDATE(), f_UpdatedIp = @CreatedIp where f_Active =1 and f_id = @id



					set @Message ='Negative Word '+ @NegativeWord +'  Deleted Successfully';



				end



			end



		else if EXISTS( select  1 from t_DoxScreening_NegativeList with(NOLOCK) where LTRIM(RTRIM(LOWER(f_NegativeWord))) = LTRIM(RTRIM(LOWER(@NegativeWord))) and f_Active =1 )



				begin

					  set @Message ='Negative Word '+ @NegativeWord +'  Already Exits';



				end	



		else if (@id!= 0)



			begin



				 update t_DoxScreening_NegativeList set f_NegativeWord =@NegativeWord , f_Updatedby = @Createdby,  f_UpdatedbyUserId = @CreatedByUserid , 



					f_UpdatedDate = GETDATE(), f_UpdatedIp = @CreatedIp where f_Active =1 and f_id = @id

					

					set @Message ='Negative Word '+ @NegativeWord +'  Updated Successfully';



			end



		else



			begin



				insert into t_DoxScreening_NegativeList (f_NegativeWord, f_Active, f_Createdby, f_CreatedbyUserId, f_CreatedDate, f_CreatedIp)



				values (@NegativeWord , 1, @Createdby, @CreatedByUserid, GETDATE(), @CreatedIp )



				set @Message ='Negative Word '+ @NegativeWord +'  Added Successfully';



			end



end


GO
/****** Object:  StoredProcedure [dbo].[usp_DoxScreening_AddUpdatePostiveList]    Script Date: 2/4/2021 10:59:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_DoxScreening_AddUpdatePostiveList]

(@id int,

 @PositiveWord varchar(200),

  @Createdby varchar(100),

   @CreatedByUserid varchar(100),

    @CreatedIp varchar(40),

	@Message varchar(200) output,

	@type varchar(10)

)

as

begin

		if(@type='delete')

			begin

					if EXISTS( select  1 from t_DoxScreening_PositiveList with(NOLOCK) where LTRIM(RTRIM(LOWER(f_PositiveWord))) = LTRIM(RTRIM(LOWER(@PositiveWord))) and f_Active =1 )

				begin

					 update t_DoxScreening_PositiveList set f_Active= 0 , f_Updatedby = @Createdby,  f_UpdatedbyUserId = @CreatedByUserid , 

					f_UpdatedDate = GETDATE(), f_UpdatedIp = @CreatedIp where f_Active =1 and f_id = @id

			

					set @Message ='Positive Word '+ @PositiveWord +'  Deleted Successfully';

				end

			end
		else if EXISTS( select  1 from t_DoxScreening_PositiveList with(NOLOCK) where LTRIM(RTRIM(LOWER(f_PositiveWord))) = LTRIM(RTRIM(LOWER(@PositiveWord))) and f_Active =1 )

				begin
					  set @Message ='Positive Word '+ @PositiveWord +'  Already Exits';

				end	
		else if (@id!= 0)

			begin
						 update t_DoxScreening_PositiveList set f_PositiveWord =@PositiveWord , f_Updatedby = @Createdby,  f_UpdatedbyUserId = @CreatedByUserid , 
								f_UpdatedDate = GETDATE(), f_UpdatedIp = @CreatedIp where f_Active =1 and f_id = @id
						set @Message ='Positive Word '+ @PositiveWord +'  Updated Successfully';
			end

		else

			begin
			
						insert into t_DoxScreening_PositiveList (f_PositiveWord, f_Active, f_Createdby, f_CreatedbyUserId, f_CreatedDate, f_CreatedIp)
						values (@PositiveWord , 1, @Createdby, @CreatedByUserid, GETDATE(), @CreatedIp )
					set @Message ='Positive Word '+ @PositiveWord +'  Added Successfully';
				end
end


GO
/****** Object:  StoredProcedure [dbo].[usp_DoxScreening_AddUpdateSpecialCharacterList]    Script Date: 2/4/2021 10:59:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_DoxScreening_AddUpdateSpecialCharacterList]
(@id int,
 @SpecialChar varchar(200),
 @Createdby varchar(100),
 @CreatedByUserid varchar(100),
 @CreatedIp varchar(40),
 @Message varchar(200) output,
 @type varchar(10)
)
as
begin
		if(@type='delete')
			begin
					if EXISTS( select  1 from t_DoxScreening_SpecialCharacterList with(NOLOCK) where LTRIM(RTRIM(LOWER(f_SpecialChar))) = LTRIM(RTRIM(LOWER(@SpecialChar))) and f_Active =1 )
				begin
					 update t_DoxScreening_SpecialCharacterList set f_Active= 0 , f_Updatedby = @Createdby,  f_UpdatedbyUserId = @CreatedByUserid , 
					f_UpdatedDate = GETDATE(), f_UpdatedIp = @CreatedIp where f_Active =1 and f_id = @id
			
					set @Message ='Special Character '+ @SpecialChar +'  Deleted Successfully';
				end
			end
		else if EXISTS( select  1 from t_DoxScreening_SpecialCharacterList with(NOLOCK) where LTRIM(RTRIM(LOWER(f_SpecialChar))) = LTRIM(RTRIM(LOWER(@SpecialChar))) and f_Active =1 )
				begin
					set @Message ='Special Character '+ @SpecialChar +'  Already Exits';
				end	
		else if (@id!= 0)
			
					begin
						update t_DoxScreening_SpecialCharacterList set f_SpecialChar =LTRIM(RTRIM(@SpecialChar)) , f_Updatedby = @Createdby,  f_UpdatedbyUserId =							@CreatedByUserid , f_UpdatedDate = GETDATE(), f_UpdatedIp = @CreatedIp where f_Active =1 and f_id = @id
						set @Message ='Special Character '+ @SpecialChar +'  Updated Successfully';
			end
		else
				begin
						insert into t_DoxScreening_SpecialCharacterList (f_SpecialChar, f_Active, f_Createdby, f_CreatedbyUserId, f_CreatedDate, f_CreatedIp)
						values (LTRIM(RTRIM(@SpecialChar)) , 1, @Createdby, @CreatedByUserid, GETDATE(), @CreatedIp )
						set @Message ='Special Character '+ @SpecialChar +'  Added Successfully';
				end
end


GO
/****** Object:  StoredProcedure [dbo].[usp_Doxscreening_AddUserMaster]    Script Date: 2/4/2021 10:59:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[usp_Doxscreening_AddUserMaster]



(



@Username varchar(200),



@Password varchar(200),



@Role varchar(10),



@Createdby varchar(100),



@CreatedbyUserId varchar(100),



@CreatedIp varchar(40),



@Message varchar(200) output,



@GateWay varchar(10) = null

)


as

begin

		set NOCOUNT ON;

		if exists (select 1 from t_Doxscreening_UserMaster with(NOLOCK) where LTRIM(RTRIM(LOWER(f_UserName))) = LTRIM(RTRIM(LOWER(@Username))) and f_Active=1)

		begin



				set  @Message ='Username already Exists';



		end

		else

			begin

				insert into t_Doxscreening_UserMaster (f_UserName, f_Password, f_Role, f_Active, f_Createdby, f_CreatedbyUserId, f_CreatedDate, f_CreatedIp, f_GateWay) 

				values (@Username, @Password, @Role, 1, @Createdby ,@CreatedbyUserId , GETDATE(), @CreatedIp, LTRIM(RTRIM(UPPER(@GateWay))))


				set @Message = 'Username '+ @Username + ' Added Successfully.'

			end

end


GO
/****** Object:  StoredProcedure [dbo].[usp_Doxscreening_dox_GetValueWeight]    Script Date: 2/4/2021 10:59:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_Doxscreening_dox_GetValueWeight](
@type varchar(4),
@GateWay varchar(10) = null
)



as



begin

	set NOCOUNT ON;

	if(@type='All')

		begin

			select f_id as Auto_Id, f_Weight as Weight , f_Value as Value , convert(varchar(11), f_CreatedDate,103) as CreatedDate, f_Active as Active , f_GateWay as GateWay  from t_DoxScreening_ValueWeight with(NOLOCK) where f_Active = 1  order by Active desc
			
		end

	else

		begin

			select top 1 f_id as Auto_Id, f_Weight as Weight , f_Value as Value , f_GateWay as GateWay  from t_DoxScreening_ValueWeight with(NOLOCK) where f_Active = 1 and LTRIM(RTRIM(UPPER(f_GateWay)))= LTRIM(RTRIM(UPPER(@GateWay)))

		end

end




GO
/****** Object:  StoredProcedure [dbo].[usp_DoxScreening_GetNegativeList]    Script Date: 2/4/2021 10:59:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_DoxScreening_GetNegativeList]
(
@type varchar(200) =null
)
as
begin
	
	select f_NegativeWord as NegativeWord,  f_id as Id, f_Createdby as CreatedBy, convert(varchar(11), f_CreatedDate,103) as CreatedDate from t_DoxScreening_NegativeList with(NOLOCK) where f_Active =1 order by CreatedDate desc
	
end

GO
/****** Object:  StoredProcedure [dbo].[usp_DoxScreening_GetPostiveList]    Script Date: 2/4/2021 10:59:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_DoxScreening_GetPostiveList]
(
@type varchar(200) = null
)
as
begin
	
	select f_PositiveWord as PositiveWord, f_id as Id,  f_Createdby as CreatedBy, convert(varchar(11), f_CreatedDate,103) as CreatedDate from t_DoxScreening_PositiveList with(NOLOCK) where f_Active =1 order by CreatedDate desc
	
end

GO
/****** Object:  StoredProcedure [dbo].[usp_DoxScreening_GetSpecialCharacterList]    Script Date: 2/4/2021 10:59:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_DoxScreening_GetSpecialCharacterList]
(
@type varchar(200) = null
)
as
begin
	
	select f_SpecialChar as SpecialChar, f_id as Id,  f_Createdby as CreatedBy, convert(varchar(11), f_CreatedDate,103) as CreatedDate from t_DoxScreening_SpecialCharacterList with(NOLOCK) where f_Active =1 order by CreatedDate desc
	
end


GO
/****** Object:  StoredProcedure [dbo].[usp_Doxscreening_GetUserMaster]    Script Date: 2/4/2021 10:59:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[usp_Doxscreening_GetUserMaster]

(

@Username varchar(200),

@Password varchar(200),

@Message varchar(200) output

)

as

begin

	if NOT exists (select 1 from t_Doxscreening_UserMaster with(NOLOCK) where LTRIM(RTRIM(LOWER(f_UserName))) = (@Username) and f_Active=1)

		begin

				set  @Message ='Username Not Exists';

		end

	if NOT exists (select 1 from t_Doxscreening_UserMaster with(NOLOCK) where LTRIM(RTRIM(LOWER(f_UserName))) = (@Username) and LTRIM(RTRIM(LOWER(f_Password))) = (@Password) and f_Active=1)

		begin

				set  @Message ='Username and Password not Match.';

		end

	else

		begin

			select f_UserName as UserName, f_UserId as UserId, f_Role as Role, f_GateWay as GateWay from t_Doxscreening_UserMaster with(NOLOCK) where LTRIM(RTRIM(LOWER(f_UserName))) = (@Username) and LTRIM(RTRIM(LOWER(f_Password))) = (@Password) and f_Active=1

			update t_Doxscreening_UserMaster set f_LastLoginDate = GETDATE() where LTRIM(RTRIM(LOWER(f_UserName))) = (@Username) and LTRIM(RTRIM(LOWER(f_Password))) = (@Password) and f_Active=1 

			set  @Message ='Username Exists';

		end	



end


GO
/****** Object:  StoredProcedure [dbo].[usp_Doxscreening_GetUserMasterDetails]    Script Date: 2/4/2021 10:59:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[usp_Doxscreening_GetUserMasterDetails]



as



begin



	set NOCOUNT ON;



	select f_UserId as UserId, f_UserName as UserName, f_Password as Password , f_GateWay as GateWay, f_Role as Role, f_Active as Active, f_Createdby as CreatedBy ,convert(varchar(11), f_CreatedDate,103) as CreatedDate,
	ISNULL(REPLACE(Convert(varchar(11), f_LastLoginDate,106),' ','-') +  Right(Convert(VarChar(20),f_LastLoginDate,100),8),'') as LastLoginDate	
	 from t_Doxscreening_UserMaster with(NOLOCK) where f_Active =1 order by 1 desc

 



end
GO
/****** Object:  StoredProcedure [dbo].[usp_Doxscreening_InsertUpdateValueWeight]    Script Date: 2/4/2021 10:59:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_Doxscreening_InsertUpdateValueWeight](

@Weight varchar(100),

 @Value varchar(100),

  @Createdby varchar(100),

   @CreatedByUserid varchar(100),

    @CreatedIp varchar(40),

	@Message varchar(200) output,

	@GateWay varchar(10) = null

)



as



begin

	set NOCOUNT ON;

	declare @output bit;

	  if EXISTS( select  1 from t_DoxScreening_ValueWeight with(NOLOCK) where f_Active =1 and LTRIM(RTRIM(UPPER(f_GateWay)))= LTRIM(RTRIM(UPPER(@GateWay))))

		begin

			 update t_DoxScreening_ValueWeight set f_Active =0 , f_Updatedby = @Createdby,  f_UpdatedbyUserId = @CreatedByUserid , 

					f_UpdatedDate = GETDATE(), f_UpdatedIp = @CreatedIp where f_Active =1 and LTRIM(RTRIM(UPPER(f_GateWay)))= LTRIM(RTRIM(UPPER(@GateWay)))

			

			set  @output =1;

		end

	

			insert into t_DoxScreening_ValueWeight (f_Weight, f_Value, f_Active, f_Createdby, f_CreatedbyUserId, f_CreatedDate, f_CreatedIp, f_GateWay)

			values (@Weight , @Value, 1, @Createdby, @CreatedByUserid, GETDATE(), @CreatedIp, @GateWay )

			



			if(@output=1)

				begin

					set @Message ='Weight, Value & GateWay Updated Successfully';

				end

			else

				begin

					set @Message ='Weight, Value & GateWay Updated Successfully';

				end



end




GO
/****** Object:  StoredProcedure [dbo].[usp_Doxscreening_UpdateUserMasterDetails]    Script Date: 2/4/2021 10:59:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_Doxscreening_UpdateUserMasterDetails](

@UserId int, 

@UserName varchar(100),

@Createdby varchar(100),

@CreatedByUserid varchar(100),

@CreatedIp varchar(40),

@Message varchar(200) output

)

as

begin

	set NOCOUNT ON;



	if exists (select 1 from t_Doxscreening_UserMaster with(NOLOCK) where f_UserId = @UserId and f_UserName = LTRIM(RTRIM(LOWER(@UserName))) and f_ACTIVE=1)

	begin

		update t_Doxscreening_UserMaster set f_Active = 0 ,

											 f_Updatedby = @Createdby,

											 f_UpdatedbyUserId = @CreatedByUserid,

											 f_UpdatedDate = GETDATE(),

											 f_UpdatedIp = @CreatedIp

		 where f_UserId = @UserId and f_UserName = LTRIM(RTRIM(LOWER(@UserName))) and f_ACTIVE=1



		 set @Message = 'User ' + @UserName + ' Deleted Successfully.'

	end

	else

		begin

			set @Message = 'No User found with User Name ' + @UserName + '.'

		end



end

GO
/****** Object:  Table [dbo].[t_DoxScreening_NegativeList]    Script Date: 2/4/2021 10:59:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_DoxScreening_NegativeList](
	[f_id] [bigint] IDENTITY(1,1) NOT NULL,
	[f_NegativeWord] [varchar](200) NULL,
	[f_Active] [bit] NULL,
	[f_Createdby] [varchar](100) NULL,
	[f_CreatedbyUserId] [varchar](100) NULL,
	[f_CreatedDate] [datetime] NULL,
	[f_CreatedIp] [varchar](40) NULL,
	[f_Updatedby] [varchar](100) NULL,
	[f_UpdatedbyUserId] [varchar](100) NULL,
	[f_UpdatedDate] [date] NULL,
	[f_UpdatedIp] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[f_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_DoxScreening_PositiveList]    Script Date: 2/4/2021 10:59:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_DoxScreening_PositiveList](
	[f_id] [bigint] IDENTITY(1,1) NOT NULL,
	[f_PositiveWord] [varchar](200) NULL,
	[f_Active] [bit] NULL,
	[f_Createdby] [varchar](100) NULL,
	[f_CreatedbyUserId] [varchar](100) NULL,
	[f_CreatedDate] [datetime] NULL,
	[f_CreatedIp] [varchar](40) NULL,
	[f_Updatedby] [varchar](100) NULL,
	[f_UpdatedbyUserId] [varchar](100) NULL,
	[f_UpdatedDate] [date] NULL,
	[f_UpdatedIp] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[f_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_DoxScreening_SpecialCharacterList]    Script Date: 2/4/2021 10:59:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_DoxScreening_SpecialCharacterList](
	[f_id] [bigint] IDENTITY(1,1) NOT NULL,
	[f_SpecialChar] [varchar](200) NULL,
	[f_Active] [bit] NULL,
	[f_Createdby] [varchar](100) NULL,
	[f_CreatedbyUserId] [varchar](100) NULL,
	[f_CreatedDate] [datetime] NULL,
	[f_CreatedIp] [varchar](40) NULL,
	[f_Updatedby] [varchar](100) NULL,
	[f_UpdatedbyUserId] [varchar](100) NULL,
	[f_UpdatedDate] [datetime] NULL,
	[f_UpdatedIp] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[f_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_Doxscreening_UserMaster]    Script Date: 2/4/2021 10:59:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_Doxscreening_UserMaster](
	[f_UserId] [bigint] IDENTITY(1,1) NOT NULL,
	[f_UserName] [varchar](200) NULL,
	[f_Password] [varchar](200) NULL,
	[f_Role] [varchar](10) NULL,
	[f_GateWay] [varchar](10) NULL,
	[f_Active] [bit] NULL,
	[f_Createdby] [varchar](100) NULL,
	[f_CreatedbyUserId] [varchar](100) NULL,
	[f_CreatedDate] [date] NULL,
	[f_CreatedIp] [varchar](40) NULL,
	[f_Updatedby] [varchar](100) NULL,
	[f_UpdatedbyUserId] [varchar](100) NULL,
	[f_UpdatedDate] [date] NULL,
	[f_UpdatedIp] [varchar](40) NULL,
	[f_LastLoginDate] [datetime] NULL,
 CONSTRAINT [PK__t_Doxscr__2F9EC5A628081C4D] PRIMARY KEY CLUSTERED 
(
	[f_UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_DoxScreening_ValueWeight]    Script Date: 2/4/2021 10:59:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_DoxScreening_ValueWeight](
	[f_id] [bigint] IDENTITY(1,1) NOT NULL,
	[f_Weight] [varchar](100) NULL,
	[f_Value] [varchar](100) NULL,
	[f_Active] [bit] NULL,
	[f_Createdby] [varchar](100) NULL,
	[f_CreatedbyUserId] [varchar](100) NULL,
	[f_CreatedDate] [date] NULL,
	[f_CreatedIp] [varchar](40) NULL,
	[f_Updatedby] [varchar](100) NULL,
	[f_UpdatedbyUserId] [varchar](100) NULL,
	[f_UpdatedDate] [date] NULL,
	[f_UpdatedIp] [varchar](40) NULL,
	[f_GateWay] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[f_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_test]    Script Date: 2/4/2021 10:59:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_test](
	[AWB] [varchar](200) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [IB_DOC_Review] SET  READ_WRITE 
GO
