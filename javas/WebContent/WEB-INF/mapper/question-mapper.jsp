<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
"http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="quesiton">

	<!-- 새로 글 쓰기 -->
	<insert id="addNew" parameterType="java.util.HashMap">
		insert into questionboard values
		(freeboard_seq.nextval, freeboard_seq.currval, 1, 0,
		#{writer},
		#{title}, #{content} , 0)
	</insert>
	
	<!-- 글 쓰면서 그룹 스탭 카운트 올리기 -->
	<update id="reviseStep" parameterType="java.util.HashMap">
		update questionboard set
		ft_step = ft_step + 1
		where ft_group =#{group } and ft_step > #{step }
	</update>
	
	<insert id="addReply" parameterType="java.util.HashMap">
		insert into questionboard values
		(freeboard_seq.nextval, #{group}, #{step}+1 , #{depth}+1,
		#{writer},
		#{title}, #{content} , 0)
	</insert>
	
	<!-- 글 리스트 가지고 오기 -->
	<select id="getAllTalks" resultType="java.util.HashMap">
		select * from questionboard
		order
		by ft_group desc, ft_step asc
	</select>
	
	<!-- 한개만 가지고 오기 -->
	<select id="getOne" resultType="java.util.HashMap">
		select * from questionboard where
		ft_num=#{num }
	</select>

	<update id="likeUp" parameterType="java.util.HashMap">
		update questionboard set ft_like = ft_like + 1 where ft_num = #{num}
	</update>
		
	<insert id="likechk" parameterType="java.util.HashMap">insert into love values
		(#{num }, #{id })</insert>

	<select id="search" parameterType="java.util.HashMap" resultType="java.util.HashMap">
		SELECT * FROM freeboard WHERE 
		<foreach collection="arr" item="keyword" separator="and">
			(ft_title LIKE #{keyword} or ft_content LIKE #{keyword})
		</foreach>
	</select>

 	<insert id="replyAdd" parameterType="java.util.HashMap">
		insert into freetalk values(FREETALK_SEQ.nextval, #{posts}, #{writer}, #{reply})
	</insert>
	
	<select id="replyList" parameterType="java.util.HashMap" resultType="java.util.HashMap">
		select * from freetalk where posts = #{posts}
	</select> 

</mapper>
















