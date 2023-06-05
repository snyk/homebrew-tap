class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1174.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1174.0/snyk-macos"
    sha256 "dfe4c2bba7d7f05530a9902520a2bada04822c17dd9d149da49b89788ee48927"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1174.0/snyk-linux"
    sha256 "b793ccad68ba7d9b249a00e0ae3760b487a32ce9767bf38d2ae2a1e9ae40f201"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
