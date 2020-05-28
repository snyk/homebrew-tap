class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.330.2"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.330.2/snyk-macos"
    sha256 "220277f1428f542ef6c73e48e9253e5db62015c0c2c0b291e5368d5f09e4f25b"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.330.2/snyk-linux"
    sha256 "a80a1e17acf8bfe39512f03c8fe905324f6a762d7f74605d1b220af46c2820c0"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
