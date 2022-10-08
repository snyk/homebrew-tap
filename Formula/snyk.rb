class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1025.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1025.0/snyk-macos"
    sha256 "a54cf7fb55fd7642b4594f5c4ec80a33bd49e08fc61d1be8d82ff3381c2bb824"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1025.0/snyk-linux"
    sha256 "58625b0029d9a85b91574ff573d45905f3d0626605749d4d3f8fb48140c4740f"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
