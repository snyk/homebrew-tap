class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.760.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.760.0/snyk-macos"
    sha256 "ad3a64dab08510d818e3267c9893f325dd987b58754134ed171966886a49f127"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.760.0/snyk-linux"
    sha256 "59c11d0c5bd823b4472508867885d0259ba0bbd50f9ed19f9ba4247ef9720bc3"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
