class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.827.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.827.0/snyk-macos"
    sha256 "b3e1c7a11c0741ead7b28cddd77fa31fe3ce55be85974d93d1c997e69b3bca23"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.827.0/snyk-linux"
    sha256 "11983a4c1f72ab8910cb9119f05255fa8fef1d3748af0900f5cd467113871dd4"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
