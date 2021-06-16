class Flashcard::Scraper    
  def self.scrape
      url = "https://ruby-doc.org/core-2.5.3/Method.html"
      doc = Nokogiri::HTML(open(url))
      all_lessons = doc.css(".method-detail")
      arr = []
      all_lessons.each do |node|
        lesson = {}
        lesson[:name] = node.css(".method-callseq").text.strip
        lesson[:description] = node.css("p").text.strip
        lesson[:example] = node.css(".ruby").text.strip
        arr << lesson
      end
      arr
    end
end