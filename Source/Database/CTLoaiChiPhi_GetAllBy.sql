USE [FastFood]
GO
/****** Object:  StoredProcedure [dbo].[CTLoaiChiPhi_GetAllBy]    Script Date: 3/13/2019 1:44:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[CTLoaiChiPhi_GetAllBy]
	@pageNumber INT,
	@pageSize INT,
	@keyText NVARCHAR(255)

AS
BEGIN
	
	IF (@keyText = '' OR @keyText IS NULL) SET @keyText = NULL

	DECLARE @pageFrom INT,@pageTo INT 
	SET @pageFrom = ((@pageNumber -1) * @pageSize) +1;

	SELECT *
	FROM dbo.LoaiChiPhi
	WHERE @keyText IS NULL 
	OR TenLoaiChiPhi LIKE '%'+ @keyText +'%'
	ORDER BY MaLoaiChiPhi
	OFFSET @pageFrom ROW
	FETCH NEXT @pageSize ROW ONLY
END

