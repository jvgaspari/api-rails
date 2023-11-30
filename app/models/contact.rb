class Contact < ApplicationRecord
  belongs_to :kind

  def author
    "Jackson Pires"
  end

  def description_without_object
    self.kind.description
  end

  def as_json(options={})
  super(
      root: true,
      methods: [:author, :description_without_object],
      include: {kind: { only: :description }}
      )
  end
end
