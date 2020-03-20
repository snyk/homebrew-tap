class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.300.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.300.0/snyk-macos"
    sha256 "9e37671e6853a6404027acf311108ae911222171ed6e250f18c7186ab195e5b2"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.300.0/snyk-linux"
    sha256 "69ca158f3c9658bd241b692ebb36448c689965e201fd71b648a6b62fb44b3211"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
