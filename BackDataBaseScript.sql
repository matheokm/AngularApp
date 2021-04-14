USE [Test]
GO
/****** Object:  Table [dbo].[Genero]    Script Date: 13/4/2021 21:09:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genero](
	[codigo] [varchar](10) NULL,
	[descripcion] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 13/4/2021 21:09:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[IdPersona] [int] IDENTITY(1,1) NOT NULL,
	[Identificacion] [nvarchar](13) NOT NULL,
	[Nombres] [nvarchar](50) NOT NULL,
	[Edad] [int] NOT NULL,
	[Codigo] [varchar](10) NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[IdPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[ActualizaPersona]    Script Date: 13/4/2021 21:09:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizaPersona](
									@IdPersona int
									,@Identificacion nvarchar(10)=''
									,@Nombres nvarchar(50)=''
									,@Edad int
									,@Codigo varchar(10)
									,@accion varchar(100)='')
AS
	If @accion = 'insertar'
	BEGIN
		INSERT INTO Test.[dbo].[Persona](Identificacion,Nombres,Edad,Codigo)
		VALUES(@Identificacion,@Nombres,@Edad,@Codigo)
	END
	ELSE IF @accion = 'actualizar'
	BEGIN
		UPDATE Test.[dbo].[Persona]
		SET 
		Identificacion        = @Identificacion
		,Nombres              = @Nombres 
		,Edad                 = @Edad
		,Codigo					=@Codigo	
		WHERE IdPersona           = @IdPersona	
	END
	ELSE IF @accion = 'eliminar'
	BEGIN
	DELETE   Test.[dbo].[Persona]   WHERE   IdPersona   = @IdPersona
	END
GO
/****** Object:  StoredProcedure [dbo].[ConsultaGenero]    Script Date: 13/4/2021 21:09:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultaGenero]
AS
BEGIN
SELECT [codigo]
      ,[descripcion]
      
  FROM [Test].[dbo].[Genero] ORDER BY [descripcion] asc
END;
GO
/****** Object:  StoredProcedure [dbo].[ConsultaPersona]    Script Date: 13/4/2021 21:09:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultaPersona]
AS
BEGIN
SELECT [IdPersona]
      ,[Identificacion]
      ,[Nombres]
      ,[Edad]
	  ,[Codigo]
  FROM [Test].[dbo].[Persona] ORDER BY [Nombres] asc
END;
GO
