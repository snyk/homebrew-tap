class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.741.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.741.0/snyk-macos"
    sha256 "809a8b77fa9f80a19dea9275fe85816f3395a4430904c5bfbb8db4efd52bca27"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.741.0/snyk-linux"
    sha256 "cb5d612d9bba8af152b9008239a5bb6f205bf1d56dc6969e2c32f763a947b43d"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
