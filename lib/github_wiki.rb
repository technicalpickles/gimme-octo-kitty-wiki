require 'nokogiri'
require 'open-uri'
require 'stringex'
require 'git'

class GithubWiki
  class Scrapper
    def initialize(github_user, github_repo, output_directory = nil)
      @output_directory = output_directory || "#{github_user}-#{github_repo}-wiki"

      @github_user, @github_repo = github_user, github_repo

    end

    def index_url
     "http://wiki.github.com/#{@github_user}/#{@github_repo}" 
    end

    def build_edit_url(page_slug)
      my_user    = Git.global_config('github.user')
      my_token   = Git.global_config('github.token')

      "http://github.com/#{@github_user}/#{@github_repo}/wikis/#{page_slug}/edit?login=#{my_user}&token=#{my_token}"
    end

    def run
      doc = Nokogiri::HTML(open(index_url))

      FileUtils.mkdir_p @output_directory

      doc.search('.sidebar ul li a').each do |page_link|
        page_title = page_link.content
        page_slug = page_title.to_url

        edit_url = build_edit_url(page_slug)
        edit_html = open(edit_url)
        edit_doc = Nokogiri::HTML(edit_html)

        textile = nil
        edit_doc.search('textarea').each do |wiki_body|
          textile = wiki_body.content
        end

        File.open("#{@output_directory}/#{page_slug}.textile", "w") do |file|
          file.write textile
        end
      end
      
    end

  end

end
