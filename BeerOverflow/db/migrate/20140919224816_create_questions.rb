class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :question
      # I really feel like this should be *calculated* versus *stored*,
      # but, it's actually a design decision and I can see why you might choose
      # to do this.  So....I'm actually like happy that you're thinking about
      # doing things in the non-conventional way.
      t.boolean :has_best_answer, default: false
      t.belongs_to :user
      t.timestamps
    end
  end
end
