class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.500.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.500.0/snyk-macos"
    sha256 "9a71f26c25315e057267e2afabd4e188f37cb2ac5e4b1d0454959083afd27606"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.500.0/snyk-linux"
    sha256 "da66a795ddc14de7de1e7effc741e2fb3cf449e29318b18dbec5e83708831615"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
