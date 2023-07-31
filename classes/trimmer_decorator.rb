require_relative 'decorator'

class TrimmerDeocrator < Decorator
  def correct_name
    @nameable.correct_name.length > 10 ? @nameable.correct_name[0, 10] : @nameable.correct_name
  end
end
