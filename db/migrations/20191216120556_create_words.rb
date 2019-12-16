Hanami::Model.migration do
  change do
    create_table :words do
      primary_key :id

      column :en, String
      column :ja, String
      column :kana, String
      column :romaji, String

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
