# This is free and unencumbered software released into the public domain.

##
# A Gitstamp commit contains the Git commit message and relevant metadata.
class Gitstamp::Commit < ::Struct.new(:id, :link, :author, :committer, :committer_date, :message, keyword_init: true)
  ##
  # Constructs a Gitstamp commit from a Git commit.
  #
  # @param  [Rugged::Commit] git the Git commit object
  # @param  [URI, #to_s] author an optional author URI override
  # @param  [URI, #to_s] committer an optional committer URI override
  # @param  [URI, #to_s] link an optional commit link URL
  # @return [Commit]
  def self.from_git(git, author: nil, committer: nil, link: nil)
    self.new(
      id: git.oid.to_s,
      link: link&.to_s,
      author: (author || "mailto:#{git.author[:email]}").to_s,
      committer: (committer || "mailto:#{git.committer[:email]}").to_s,
      committer_date: git.committer[:time],  # preserves the timezone
      message: git.message.to_s,
    )
  end

  ##
  # Returns the Arweave metadata tags for this commit.
  #
  # @return [Hash<String, String>]
  def to_tags
    {
      'Content-Type' => 'text/plain',
      'App-Name' => 'Gitstamp',
      'Git-Commit' => self.id.to_s,
      'Git-Commit-Link' => self.link&.to_s,
      'Git-Author' => self.author&.to_s,
      'Git-Committer' => self.committer&.to_s,
      'Git-Committer-Date' => self.committer_date&.strftime("%Y-%m-%dT%H:%M:%S%:z"),
    }.delete_if { |k, v| v.nil? }
  end
end # Gitstamp::Commit
