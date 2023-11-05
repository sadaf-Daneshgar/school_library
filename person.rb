class Person
    attr_accessor :name, :age
    attr_reader :id

    def initialize(age, name = "Unknown", parent_permission: true)
        @id = Random.rand(1..1000)
        @age = age
        @name = name
        @parent_permission = parent_permission
    end

    private

    def of_age?
        if @age >= 18
            true
        else
            false
        end
    end

    public

    def can_use_services?
        if of_age? || @parent_permission
            true
        else
            false
        end
    end
end
