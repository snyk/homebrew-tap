class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.669.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.669.0/snyk-macos"
    sha256 "64dda878b27d83d8f24ec4edeb989e1e07456828fb2414c6c5906da7e06637eb"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.669.0/snyk-linux"
    sha256 "73306d8116bb0e443a05e47e9162bda22dc8562b3703f5f039de9503d7a3ae26"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
