class Comment < ApplicationRecord
  belongs_to :post

  def not_a_hacker(ip_address_to_screen)
    if Comment.where("ip_address ILIKE ? AND created_at >= ?", /\b\d{1,3}\.\d{1,3}\.\d{1,3}\b/.match(ip_address_to_screen).to_s + '%', DateTime.now - 1.hour).length >= 5
      false
    else
      true
    end
  end
end