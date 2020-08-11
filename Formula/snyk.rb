class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.372.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.372.0/snyk-macos"
    sha256 "4fe49b2adc3f7a7f85bb1f5a41504751bafe00049fed4f990643cd5cd6192259"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.372.0/snyk-linux"
    sha256 "0d08af36e90b0e67d73a012cb611c0edc82fa303399099aad275f80abbad1a9d"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
