require 'rails_helper'

RSpec.describe BookService do
  it 'gets books by location', :vcr do
    response = BookService.get_books('denver,co')

    expect(response).to be_a Hash
    expect(response.keys).to eq([:numFound, :start, :numFoundExact, :docs, :num_found, :q, :offset])
    expect(response[:numFound]).to eq 38
    expect(response[:docs].count).to eq 38
      response[:docs].each do |doc|
        expect(doc).to have_key(:title)
        expect(doc[:title].downcase).to include('denver')
        expect(doc.keys).to eq([:key,
                                :type,
                                :seed,
                                :title,
                                :title_suggest,
                                :subtitle,
                                :edition_count,
                                :edition_key,
                                :publish_date,
                                :publish_year,
                                :first_publish_year,
                                :isbn,
                                :last_modified_i,
                                :ebook_count_i,
                                :ebook_access,
                                :has_fulltext,
                                :public_scan_b,
                                :publisher,
                                :language,
                                :author_key,
                                :author_name,
                                :author_alternative_name,
                                :publisher_facet,
                                :_version_,
                                :author_facet])
      end
  end
end
