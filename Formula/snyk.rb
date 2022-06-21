class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.954.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.954.0/snyk-macos"
    sha256 "219150d6019104cf684fa5476347fd1cb9b72864e069943a9f342e65520a6b07"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.954.0/snyk-linux"
    sha256 "3e08b78e41fa4a86556d117a42720f987832833e393e8da5ac23bb9aa496a62e"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
