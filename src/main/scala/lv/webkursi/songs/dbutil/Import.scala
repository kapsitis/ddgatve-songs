package lv.webkursi.songs.dbutil

import java.io.{File, FileInputStream}
import scala.xml._
import java.sql.{Connection, DriverManager, ResultSet};
import java.sql.PreparedStatement
//import com.mysql.jdbc.PreparedStatement

object Import {

  def main(args: Array[String]): Unit = {  
	   Class.forName("com.mysql.jdbc.Driver").newInstance();
	val conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/musicbase", "musicbase", "musicbase")
 try {
	    
	// Configure to be Read Only
	    val statement = conn.createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY)
	 println("2")
	    // Execute Query

	 println("3")
	    // Iterate Over ResultSet
	    /*while (rs.next) {
	    	println("4")
	        println(rs.getString("title"))
	    }*/
	
	  val f = new File("songs/xml")
	  val arr:Array[String] = f.list
	  val xmlFiles = arr filter { s => s.endsWith(".xml") }
	   println(xmlFiles.toList)
	   val pstmt = conn.prepareStatement("insert into song (title, tagcloud, narrator, musicby, lyricsby, references_c, lyrics)values(?, ?, ?, ?, ?, ?, ?)")
	   //val pstmt2 = conn.prepareStatement("insert into source (song, sourcetype) values (?, ?)")
	   
	   for (file <- xmlFiles) {
	  	  //println((dziesma\\"song"\"title").head.text) 
	  	   val dziesma:Node = XML.load(new FileInputStream("songs/xml/" + file))
	  	   val t:String = (dziesma\\"song"\"title").head.text	    
	  	   pstmt.setString(1, t)
	  	   //val rsSource:String = (dziesma\\"song"\"source").head.text  	   
	  	   //pstmt2.setString(2, rsSource)
	  	   val rsTags = (dziesma\\"song"\"tags").head.text
	  	   pstmt.setString(2, rsTags)
	  	   val rsNarrator = (dziesma\\"song"\"narrator").head.text
	  	   pstmt.setString(3, rsNarrator)
	  	   val rsMusicBy = (dziesma\\"song"\"musicBy").head.text
	  	   pstmt.setString(4, rsMusicBy)
	  	   val rsLyricsBy = (dziesma\\"song"\"lyricsBy").head.text
	  	   pstmt.setString(5, rsLyricsBy)
	  	   val rsRef = (dziesma\\"song"\"ref").head.text
	  	   pstmt.setString(6, rsRef)
	  	   val rsLyrics = (dziesma\\"song"\"lyrics").head.text
	  	   pstmt.setString(7, rsLyrics)
	  	   pstmt.executeUpdate()
	  	   // XPath 1.0
	  	   //println((dziesma\\"song"\"lyrics").head.text)
	  	     println(t)
	 }
	//val conn_str = 
	println("1")
	
  }
	finally {
	    conn.close
	}
   	
	}

}