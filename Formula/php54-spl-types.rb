require File.join(File.dirname(__FILE__), 'abstract-php-extension')

class Php54SplTypes < AbstractPhp54Extension
  init
  homepage 'http://pecl.php.net/package/SPL_Types'
  url 'http://pecl.php.net/get/SPL_Types-0.4.0.tgz'
  sha1 '14c2ccd34c5f4fc98b5af4a62267bc7fd71c9546'

  def install
    Dir.chdir "SPL_Types-#{version}"

    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig
    system "make"
    prefix.install "modules/spl_types.so"
    write_config_file unless build.include? "without-config-file"
  end
end
