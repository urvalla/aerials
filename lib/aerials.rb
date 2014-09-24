require "aerials/version"

class Aerials
  def self.sign(struct, exclude: [])
    create_json(struct, exclude)
  end

  def self.create_json_rails(struct, exclude: [:action, :controller, :key])
    self.create_json(struct, exclude: exclude)
  end

  def self.create_json(struct, exclude: [])
    if struct.is_a? Hash
      struct = struct.clone
      exclude.each { |key| struct.delete(key) }
      struct = struct.sort
      "{#{ struct.map{|elem| "#{to_val elem[0]}:#{to_val elem[1]}"}.join(',') }}"
    elsif struct.is_a? Array
      struct = struct.clone.sort
      "[#{ struct.map{|elem| to_val elem }.join(',') }]"
    elsif struct.respond_to? :to_s
      struct.to_s
    else
      ''
    end
  end

  def self.to_val(elem)
    elem = elem.to_s if elem.is_a?(Symbol)

    if elem.is_a?(Hash) || elem.is_a?(Array)
      self.create_json(elem)
    elsif elem.is_a?(String)
      "'#{ elem.to_s.gsub("'","\\'") }'"
    else
      "'#{ elem.to_s }'"
    end
  end
end
