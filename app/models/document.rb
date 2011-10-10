class Document < ActiveRecord::Base
  set_table_name "tt_news"
  set_inheritance_column :ruby_type
  set_primary_key "uid"

  def self.active
    where("deleted = 0 AND hidden = 0 and pid = 102")
  end
  
  def self.search(numero, documento, oggetto, descrizione, data)
    sql = "1"
    sql += " AND tx_myalbopretorio_numero=\'#{numero}\'" if !numero.nil? && !numero.blank?
    sql += " AND tx_myalbo2_documento = #{documento}" if !documento.nil? && !documento.blank?
    sql += " AND (title LIKE \'%#{oggetto}%\' OR short LIKE \'%#{oggetto}%\')" if !oggetto.nil? && !oggetto.blank?
    where(sql)
  end 
end
