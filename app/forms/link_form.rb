class LinkForm
  include ActiveModel::Model

  attr_accessor :url

  validates_presence_of :url
  validates_format_of :url, with: URI::DEFAULT_PARSER.regexp[:ABS_URI]
end
