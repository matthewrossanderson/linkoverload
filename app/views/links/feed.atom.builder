atom_feed :language => 'en-US' do |feed|
 feed.title @title
 feed.updated @updated

  @links.each do |item|
    next if item.updated_at.blank?
    feed.entry( item ) do |entry|
      entry.url link_url(item)
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
