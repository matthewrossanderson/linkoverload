atom_feed :language => 'en-US' do |feed|
 feed.title @title
 feed.updated @updated

  @links.each do |item|
    next if item.updated_at.blank?
    feed.entry( item, url: item.url ) do |entry|
      entry.url item.url
      entry.title item.url
      entry.content item.description, :type => 'html'

      # the strftime is needed to work with Google Reader.
      entry.updated(item.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ")) 

      entry.author do |author|
        author.name item.submitter
      end
    end
  end
end
