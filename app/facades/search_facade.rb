class SearchFacade

  def initialize(house)
    @house = house
  end

  def header
    "#{get_results.count} Students"
  end

  def get_results
    results.map do |student_data|
      Member.new(student_data)
    end
  end

  private
    def service
      @_service ||= SearchService.new(@house)
    end

    def results
      @_results ||= service.get_members
    end
end
