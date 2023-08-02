require_relative 'person'

class Teacher < Person
  def initialize(specialization, age, name = 'unknown', id = nil, parent_permission: true)
    id ||= Random.rand(1..188)

    super(id, age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_hash
    {
      'id' => @id,
      'type' => self.class.name,
      'name' => @name,
      'age' => @age,
      'specialization' => @specialization,
      'parent_permission' => @parent_permission,
      'rentals' => @rentals.map { |rental| { 'date' => rental.date } }
    }
  end
end
