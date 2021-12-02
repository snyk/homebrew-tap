class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.782.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.782.0/snyk-macos"
    sha256 "ef5bb5502692ec43f4421f2a99284d51cab101c67fed7273152290d0efdbd7df"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.782.0/snyk-linux"
    sha256 "5ce0ee4b0328b2286beb55ebc8c73859d2089034b1c7dc72a50099ff968f67fc"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
