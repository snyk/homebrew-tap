class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.414.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.414.1/snyk-macos"
    sha256 "205c04c84265c1b8b1f38feeddab46f761ec2f8fbbf7124adc2652d2d6c62ea0"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.414.1/snyk-linux"
    sha256 "6b90175ef111cc5e4502a6e9e4dcc19e58da275c0fc2ca48631ed256a7e94bbb"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
