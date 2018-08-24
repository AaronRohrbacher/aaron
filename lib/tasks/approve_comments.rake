task approve_comments: :environment do
  def response_validation(response, comment)
    if response != "y" && response != "n"
      puts '-----'
      puts 'Invalid response. Correct response: y or n'
      puts '-----'
      check_comment(comment)
    else
      return true
    end
  end

  def approve_deletion(comment)
    puts 'Confirm deletion'
    approve = STDIN.gets.strip
    if response_validation(approve, comment)
      if approve == 'n'
        puts '-----'
        puts 'Deletion cancelled. Try again.'
        puts '-----'
        check_comment(comment)
      end
      if approve == 'y'
        comment.destroy
        puts '-----'
        puts 'Comment deleted'
        puts '-----'
      end
    end
  end

  def approve_or_delete_comment(response, comment)
    if response == 'y'
      comment.update(approved: true)
      puts '-----'
      puts 'Comment approved'
      puts '-----'
    end
    if response == 'n'
      approve_deletion(comment)
    end
  end

  def check_comment(comment)
    puts 'Post: ' + comment.post.title
    puts 'Commenter: ' + comment.name
    puts 'Comment:'
    puts comment.content
    puts 'Approve comment?'
    response = STDIN.gets.strip
    if response_validation(response, comment)
      approve_or_delete_comment(response, comment)
    end
  end

  comments = Comment.where(approved: false)
  puts '-----'
  comments.each do |comment|
    check_comment(comment)
  end
  puts '-----'
  puts 'All comments reviewed.'
end
