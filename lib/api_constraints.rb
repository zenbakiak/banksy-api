# frozen_string_literal: true

class ApiConstraints
  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end

  def matches?(_req)
    @default || accept_header?
  end

  def accept_header
    "application/vnd.banksyapp.v#{@version}"
  end

  def accept_header?
    req.headers['Accept'].include?(accept_header)
  end
end
