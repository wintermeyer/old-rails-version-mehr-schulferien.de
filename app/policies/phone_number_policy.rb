class PhoneNumberPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    if user && user.admin?
      true
    else
      false
    end
  end

  def new?
    create?
  end

  def update?
    if user && user.admin?
      true
    else
      false
    end
  end

  def edit?
    update?
  end

  def destroy?
    if user && user.admin?
      true
    else
      false
    end
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
