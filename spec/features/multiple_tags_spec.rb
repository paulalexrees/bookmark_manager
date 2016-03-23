feature 'giving a link multiple tags' do
  scenario 'a link has more than 1 tag' do
    add_link_with_tag("Twitch", "www.twitch.tv", "gaming streaming")
    link = Link.first 
    expect(link.tags.map(&:name)).to include("gaming")
    expect(link.tags.map(&:name)).to include("streaming")
    expect(link.tags.map(&:name)).not_to include("gaming streaming")
  end

end
